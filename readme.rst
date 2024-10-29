Info
====

This repository is a minimal reproduction of the bug at:

https://github.com/cloudflare/workerd/issues/2998

Running
-------

Starting:

    % docker compose up

Rerunning tests:

    % docker compose restart tests

Interpreting
------------

After the minimal Wrangler worker and fake origin server have started, the
``tests`` container will run. It issues two requests, both will incorrectly
return 25 bytes instead of ~10MB. The first request does not trigger a memory
error in the worker, but each request after will.

You will notice 25 bytes returned by ``curl``, the ``fileserver`` exception
about the connection being severed, and ``wrangler`` will show errors about
memory limits and errors from HTMLWriter, even though there is no HTMLWriter
invoked at all in the worker.

The error from Wrangler is:

    workerd/server/server.c++:3422: error: Uncaught exception: workerd/api/html-rewriter.c++:99: failed: remote.jsg.TypeError: Parser error: The memory limit has been exceeded.

What seems to be happening
--------------------------

Wrangler workers seem to inspect inner URLs on ``img`` elements with ``data:``
URLs. Because the data URL is 10MB inline, this causes a memory limit error on
the worker.
