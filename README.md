DKRON busy bug
==============

Reproduce bug where DKRON jobs stay "stuck" in the busy state.
See [this bug report](https://github.com/distribworks/dkron/issues/1483) in GitHub.

Steps to reproduce:

1. Check out this repository locally.
2. Run `docker-compose up --force-recreate -d`.  This will create clusters
   for DKRON 3.2.6, 3.2.7, and 4.0.2.
3. Wait a minute for DKRON to stabilize and then run `addRedisJobs.sh`
   to create test jobs in each DKRON cluster.
4. Wait about 15 minutes.
5. Check the busy tab for each DKRON version:
    1. <http://localhost:8080/ui/#/busy> (DKRON 3.2.6)
    2. <http://localhost:8081/ui/#/busy> (DKRON 3.2.7)
    3. <http://localhost:8082/ui/#/busy> (DKRON 4.0.2)

Expected result
---------------

All DKRON UIs show no busy jobs older than 10 seconds.

Actual result
-------------

DKRON 3.2.6 shows no busy jobs older than 10 seconds.  DKRON versions
newer than 3.2.6 show multiple "stuck" jobs.

