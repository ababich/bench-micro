# bench some web microframeworks (Ruby)

Because we don't have enough drama, let's bench some *hello world* apps!

## Why?

As part of some research, collected some benchmark around Ruby web
microframeworks.

The idea is bench the performance from [Rack](https://github.com/rack/rack),
throught the stack of the framework to the minimum representation of an
application (*Hello World* apps).

It is not the goal to bechmark hits to the database or external services,
nor to do a silly *fibonacci-as-a-service*, ok?

## What?

Rack 2 compatible frameworks

- [Cuba](https://github.com/soveran/cuba) - [cuba.ru](apps/cuba.ru)
- [Flame](https://github.com/AlexWayfer/flame) - [flame.ru](apps/flame.ru)
- [Grape](https://github.com/ruby-grape/grape) - [grape.ru](apps/grape.ru)
- [Hanami (Router)](https://github.com/hanami/router) - [hanami-router.ru](apps/hanami-router.ru)
- [Hobbit](https://github.com/patriciomacadden/hobbit) - [hobbit.ru](apps/hobbit.ru)
- [Hobby](https://github.com/ch1c0t/hobby) - [hobby.ru](apps/hobby.ru)
- [Newark](https://github.com/mje113/newark) - [newark.ru](apps/newark.ru)
- [Plezi](https://github.com/boazsegev/plezi) - [plezi.ru](apps/plezi.ru)
- [Rack](https://github.com/rack/rack) - [rack.ru](apps/rack.ru) + [rack-response.ru](apps/rack-response.ru)
- [Rack-App](https://github.com/rack-app/rack-app) - [rack-app.ru](apps/rack-app.ru)
- [RackStep](https://github.com/mfdavid/rackstep) - [rackstep.ru](apps/rackstep.ru)
- [Rails (API + Metal)](https://github.com/rails/rails) - [rails-api.ru](apps/rails-api.ru)  + [rails-metal.ru](apps/rails-metal.ru)
- [Rambutan](https://github.com/NewRosies/rambutan) - [rambutan.ru](apps/rambutan.ru)
- [Roda](https://github.com/jeremyevans/roda) - [roda.ru](apps/roda.ru)
- [Sinatra](https://github.com/sinatra/sinatra) - [sinatra.ru](apps/sinatra.ru)
- [Syro](https://github.com/soveran/syro) - [syro](apps/syro.ru)
- [Watts](https://github.com/pete/watts) - [watts](apps/watts.ru)

Please note that while Rails has been added to the list, it is just a
minimalistic representation with ActionPack gem (using API and Metal, no full middleware stack, etc). You
shouldn't take the performance numbers mentioned here about Rails (or any
other) as scientific and decision-taking references.

## How?

Used [wrk](https://github.com/wg/wrk) to benchmark, locally, a burst of
requests (in 2 threads) over 10 seconds. The command line used was:

```console
$ wrk -t 2 http://localhost:9292/
```

All the frameworks using [Puma](https://github.com/puma/puma) on
Ruby 2.4, in production mode with 16 threads:

```console
$ puma -e production -t 16:16 apps/<framework.ru>
```

## Run benchmark for all frameworks

```console
# use `bundle exec`, if needed
$ bench/summary-memory
$ bench/summary-speed
```

### Have some numbers around?

Yup, I do:

#### Requests/sec
<!-- speed_table -->
```
Framework            Requests/sec  % from best
----------------------------------------------
rack                      3912.20      100.00%
syro                      3626.70       92.70%
watts                     3560.82       91.02%
cuba                      3509.21       89.70%
rack-response             3351.42       85.67%
rambutan                  3285.18       83.97%
roda                      3203.41       81.88%
hanami-router             3115.99       79.65%
hobbit                    3080.47       78.74%
hobby                     3022.36       77.25%
rack-app                  2950.24       75.41%
newark                    2930.81       74.91%
plezi                     2822.49       72.15%
rackstep                  2748.13       70.25%
rails-metal               2202.20       56.29%
sinatra                   2157.43       55.15%
grape                     1813.13       46.35%
flame                     1787.63       45.69%
rails-api                  616.35       15.75%
```
<!-- speed_table_end -->

#### Memory Allocation/Request
<!-- mem_table -->
```
Framework       Allocs/Req Memsize/Req
--------------------------------------
rack                    40        2880
roda                    43        3488
syro                    44        3568
cuba                    45        3568
watts                   47        3160
hobbit                  48        3888
hobby                   52        4232
rack-response           55        4096
rails-metal             62        5848
plezi                   65        5000
hanami-router           66        4800
newark                  71        5888
rackstep                79        4864
rambutan                81        5864
rack-app                82        7336
flame                  123        8456
sinatra                188       12160
grape                  253       20008
rails-api              370       27050
```
<!-- mem_table_end -->

#### Hardware

These numbers were collected on:

- Ubuntu 16.10 64-bit (kernel: 4.8.0-56-generic)
- Dell XPS 13 (9343, QHD, Developer Edition)
- Intel® Core™ i7-5500U CPU @ 2.40GHz × 4
- 8GB RAM
- 256GB SSD
- ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux]
