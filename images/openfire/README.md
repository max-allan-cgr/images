<!--monopod:start-->
# openfire
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/openfire` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/trino/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
XMPP
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/openfire:latest
```
<!--getting:end-->


<!--  ALL THIS NEEDS REWRITING!!! -->


<!--body:start-->
## Usage

```
mkdir database
OPENFIRE=$(docker run -p 5222:5222 -p 5223:5223 -p 7443:7443 -p 5269:5269 -p 5270:5270 -p 9090:9090 -p 9091:9091 -d -v`pwd`/database:/usr/local/openfire/embedded-db cgr.dev/chainguard/openfire:latest)

# Run initial setup via browser to localhost:9090

docker cp ${OPENFIRE}:/usr/local/openfire/conf/openfire.xml .
docker cp ${OPENFIRE}:/usr/local/openfire/conf/security.xml .

docker kill $OPENFIRE

docker run -p 5222:5222 -p 5223:5223 -p 7443:7443 -p 5269:5269 -p 5270:5270 -p 9090:9090 -p 9091:9091 -d -v`pwd`/openfire.xml:/usr/local/openfire/conf/openfire.xml -v`pwd`/security.xml:/usr/local/openfire/conf/security.xml  -v`pwd`/database:/usr/local/openfire/embedded-db cgr.dev/chainguard/openfire:latest

```
You can now login to the admin console at localhost:9090.

When doing initial setup do not restrict access to admin console because of how Docker uses IP addresses.

<!--body:end-->
