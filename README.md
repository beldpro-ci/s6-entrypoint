# s6-example

> Simple example showing the use of [s6](http://skarnet.org/software/s6/) as a process supervisor with docker


## Running

  ```
  make build
  make run
  ```

This will start a container with `s6` supervising two services: `lala` and `lulu`. Each of these services does a single thing: print `number - <time>` to stdout each second (functionality from `/etc/bin/my-binary`). 

  ```
  .
  ├── Dockerfile
  ├── Makefile
  ├── README.md
  └── etc
      ├── bin
      │   └── my-binary   // main executable
      └── s6
          ├── lala
          │   ├── finish  // lala "on-fail" script
          │   └── run     // lala service start-up script
          └── lulu
              ├── finish  // lulu "on-fail" script
              └── run     // lulu start-up script
  ```

