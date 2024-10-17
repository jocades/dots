use std::fs::File;
use std::os::unix::fs::PermissionsExt;

fn main() -> std::io::Result<()> {
    for path in std::env::args() {
        let f = File::open(path)?;
        let meta = f.metadata()?;
        let perm = meta.permissions();

        println!("file: {:?} permission: {}", f, perm.mode());
    }

    Ok(())
}
