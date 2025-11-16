Tarsnapper-Docker
=================

This is a very basic docker image that utilizes **_[🔗Tarsnapper](https://github.com/miracle2k/tarsnapper)_** inside of a docker image to make Grandfather Father Son (GFS) style backups. The primary goal is to take GFS backups of a volume linked into the docker container. This can be used to easily make GFS backups of a data folder of another container by linking the volume into a container of this image as well.

## Example Usage

```bash
docker run awbmilne/
```

## Expected Volumes
This image creates backups of the `/data` folder and stores them in the `/backups` folder by default. Alternative behaviour can be configured using the environemnt variables below.

## Environment variables
| Variable | Description | Example |
|----------|-------------|---------|
| `TARSNAPPER_DELTAS` | The GFS scheme to use for Tarsnapper. Refer to [Tarsnapper](https://github.com/miracle2k/tarsnapper) docs for more info. | `7d 30d 365d` |
| `TARSNAPPER_CRON` | CRON schedule for creating new backups | `0 0 * * *` |
| `TARSNAPPER_OUTPUT_DIR` | Directory to store backups | Default: `/backups` |
| `TARSNAPPER_BACKUP_NAME` | Naming format to use for Tarsnapper. Refer to [Tarsnapper](https://github.com/miracle2k/tarsnapper) docs for more info. | Default: `backups-$date` |
| `TARSNAPPER_SOURCES` | The locations for Tarsnapper should backup. Refer to [Tarsnapper](https://github.com/miracle2k/tarsnapper) docs for more info. | Default: `/data` |

