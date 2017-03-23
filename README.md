# s6-example

> Simple example showing the use of [s6](http://skarnet.org/software/s6/) as a process supervisor with docker


## Running

  ```
  make build
  make run
  ```

This will start a container with `s6` supervisioning two services: `lala` and `lulu`. Each of these services does a single thing: print `number - <time>` to stdout each second (functionality from `/etc/bin/my-binary`). 

  ```
  .
  ├── Dockerfile
  ├── Makefile
  ├── README.md
  └── etc                   // added to `/etc` of image
      ├── bin
      │   └── my-binary     // main executable
      └── s6
          ├── .s6-svscan    // sv6scan configuration (not a service)
          |   └── finish        // cleans everything on a SIGTERM to PID 1
          ├── lala          // lala service
          │   ├── finish        // lala "on-fail" script
          │   └── run           // lala service start-up script
          └── lulu          // lulu service
              ├── finish        // lulu "on-fail" script
              └── run           // lulu start-up script
  ```

Each of the services ( `lulu` and `lala` ) have their start-up scripts defined at `/etc/s6/<service>/run`. Each one of them writes their `stdout` and `stderr` to log files, namely, `/var/log/<service>`; always appending (check the `run` files!). On a malfunction, `/etc/s6/<service>/finish` is called. On a termination of the init pid (`s6-svscan`) `./etc/s6/.s6-svscan` is called. 

Note: the directory *doesn't need to be called `/etc/s6`, it can be anything*. Just make sure that you get the `.s6-svscan`, `run` and `finish` namings right (and no `run` deeply nested at the scan directory - it will only look on a max depth of 1).

