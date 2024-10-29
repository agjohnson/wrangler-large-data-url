#!/bin/sh
content=$(dd if=/dev/random bs=1MB count=10 | base64 -w0)
echo "<html><head></head><body><img src='data:image/png;base64,$content' /></body></html>"
