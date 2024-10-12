use rand::prelude::*;

fn experiment(n: u32) -> u32 {
    let mut rng = thread_rng();
    (0..n).filter(|_| rng.gen_range(0..3) == rng.gen_range(0..3)).count() as u32
}

fn experiment2(n: u32) -> u32 {
    let mut rng = thread_rng();
    (0..n).filter(|_| {
        let prize = rng.gen_range(0..3);
        let initial_choice = rng.gen_range(0..3);
        let possible = if prize == initial_choice {
            [0, 1, 2]
        } else {
            [0, initial_choice, prize]
        };
        let final_choice = possible[rng.gen_range(0..possible.len())];
        prize == final_choice
    }).count() as u32
}

fn calculate_probability(win_count: u32, total: u32) -> f64 {
    (win_count as f64 / total as f64) * 100.0
}

fn main() {
    const N: u32 = 1_000_000;
    
    let win_count = experiment(N);
    println!("Experiment #1 probability: {:.2}%", calculate_probability(win_count, N));

    let win_count2 = experiment2(N);
    println!("Experiment #2 probability: {:.2}%", calculate_probability(win_count2, N));
}