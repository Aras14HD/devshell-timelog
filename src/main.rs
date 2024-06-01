use chrono::{prelude::*, Duration};
use core::panic;
use std::env::{args, current_dir};
use std::fs::read_to_string;

#[derive(Debug, Clone, Copy)]
enum RecordType {
    Clockin,
    Commit,
}

fn main() {
    let arg = args().skip(1).next().unwrap();
    let pwd = current_dir().unwrap();
    let path = pwd.join(arg);
    let file = read_to_string(path).unwrap();
    let total = file
        .lines()
        .map(|s| {
            let (time, typ) = s.split_once(' ').unwrap();
            let time = DateTime::parse_from_str(time, "%Y-%m-%dT%H:%M%:z").unwrap();
            let typ = match typ {
                "clockin" => RecordType::Clockin,
                "commit" => RecordType::Commit,
                _ => panic!("unsupported record type"),
            };
            (time, typ)
        })
        .fold(
            (
                Duration::zero(),
                DateTime::from_timestamp_nanos(0).fixed_offset(),
                RecordType::Commit,
            ),
            |(total, last_time, last_typ), (time, typ)| match (last_typ, typ) {
                (RecordType::Commit, RecordType::Clockin) => (total, time, typ),
                (RecordType::Clockin, RecordType::Clockin)
                    if time.signed_duration_since(last_time) > Duration::minutes(20) =>
                {
                    (total, time, typ)
                }
                _ => (total + time.signed_duration_since(last_time), time, typ),
            },
        )
        .0;
    println!(
        "Total time working: {}h {}m",
        total.num_hours(),
        total.num_minutes() - total.num_hours() * 60
    );
}
