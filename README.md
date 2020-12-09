# MSSQL SSIS

This repo contains a `Dockerfile` to build
a Linux [Docker](https://www.docker.com) image containing the Microsoft
[SQL Server Tools](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools?view=sql-server-linux-2017)
, [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/), and 
[Terraform](https://www.terraform.io/docs/cli-index.html)
packages for Linux. The image also includes Microsoft's
[ODBC driver for SQL Server](https://docs.microsoft.com/en-us/sql/connect/odbc/microsoft-odbc-driver-for-sql-server?view=sql-server-linux-2017).

## Usage

To instantiate an ephemeral container from the image, mount the current
directory within the container, and open a bash prompt within the `base` conda
Python environment:

```bash
docker run -it --rm -v $(pwd):/home/docker/work blueogive/azinfra:latest
```

Contributions are welcome.
