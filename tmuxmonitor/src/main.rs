use sysinfo::{Components, Disks, Networks, System};

fn main() {
    // Please note that we use "new_all" to ensure that all lists of
    // CPUs and processes are filled!
    let mut sys = System::new_all();

    // First we update all information of our `System` struct.
    sys.refresh_all();

    println!("=> system:");
    // RAM and swap information:
    println!("total memory: {} bytes", sys.total_memory());
    println!("used memory : {} bytes", sys.used_memory());

    let memory_percentage =
        sys.used_memory() as f32 / sys.total_memory() as f32 * 100.0;
    println!("used memory : {:.2}%", memory_percentage);

    println!("total swap  : {} bytes", sys.total_swap());
    println!("used swap   : {} bytes", sys.used_swap());

    // Display system information:
    println!("System name:             {:?}", System::name());
    println!("System kernel version:   {:?}", System::kernel_version());
    println!("System OS version:       {:?}", System::os_version());
    println!("System host name:        {:?}", System::host_name());

    // Number of CPUs:
    println!("NB CPUs: {}", sys.cpus().len());

    // get the cpu usage percentage in total
    loop {
        sys.refresh_cpu_usage();
        for cpu in sys.cpus() {
            println!("CPU {} : {:.2}%", cpu.name(), cpu.cpu_usage());
        }
        std::thread::sleep(std::time::Duration::from_secs(1));
        // std::thread::sleep(sysinfo::MINIMUM_CPU_UPDATE_INTERVAL);
    }

    // Display processes ID, name na disk usage:
    /* for (pid, process) in sys.processes() {
        println!("[{pid}] {:?} {:?}", process.name(), process.disk_usage());
    }

    // We display all disks' information:
    println!("=> disks:");
    let disks = Disks::new_with_refreshed_list();
    for disk in &disks {
        println!("{disk:?}");
    } */

    // Network interfaces name, total data received and total data transmitted:
    /* let networks = Networks::new_with_refreshed_list();
    println!("=> networks:");
    for (interface_name, data) in &networks {
        println!(
            "{interface_name}: {} B (down) / {} B (up)",
            data.total_received(),
            data.total_transmitted(),
        );
        // If you want the amount of data received/transmitted since last call
        // to `Networks::refresh`, use `received`/`transmitted`.
    } */

    // Components temperature:
    /* let components = Components::new_with_refreshed_list();
    println!("=> components:");
    for component in &components {
        println!("{component:?}");
    } */
}
