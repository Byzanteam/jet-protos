fn main() -> Result<(), Box<dyn std::error::Error>> {
    tonic_build::configure()
        .protoc_arg("--experimental_allow_proto3_optional")
        .build_server(true)
        .compile(&["protos/api.proto", "protos/server.proto"], &["."])?;
    Ok(())
}
