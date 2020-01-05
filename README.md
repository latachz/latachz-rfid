# Latachz Rfid

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [License](#license)
* [Contact](#contact)



<!-- ABOUT THE PROJECT -->
## About The Project

RFID(RC522) + Raspberry Pi 3 checking attendance and writing user with web interface created with Phoenix.


### Built With

* [Phoenix](https://www.phoenixframework.org/)
* [Python](https://www.python.org/)
* [PostgreSQL](https://www.postgresql.org/)



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

![Pins](https://i.stack.imgur.com/VzdSh.jpg)

### Using
 
1. Clone the repo
```sh
git clone https://github.com/latachz/latachz-rfid.git
```

#### Web interface

1. Preparing:
```sh
cd web && mix deps.get
```
2. Starting it:
```sh
mix phx.server
```

#### Creating users
```sh
python3 add_user.py
```

#### Checking attendance
```sh
python3 check_attendance.py
```

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- CONTACT -->
## Contact

Kacper Latuszewski - [@kacpx123](https://twitter.com/kacpx123) - kacpx123@gmail.com


