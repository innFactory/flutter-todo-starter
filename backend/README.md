# Todo API

## Getting Started

### IMPORTANT

To load innFactory-scala-utils a Github-Personal-Access-Token with package:read has to be exported as GITHUB_TOKEN.
This is necessary to load the packages from Github-Package-Registry.

### See [Quickstart Dev Guide](./doc/QuickstartDevGuide.md)

### Insomnia

- [Download Insomnia](https://insomnia.rest/download) | [Docs](https://support.insomnia.rest/)
- Import insomnia.json from doc-assets
- Configure Environment in Insomnia to match with local or prod/staging services

#### MacOS/Linux/Unix

##### Prerequisites

- Install Docker
- Install sbt
- Install openJDK 11
- firebase.json (Firebase Service-Account-Access json with firebase-admin-sdk rights) in __./conf/__

##### Run locally

If prerequisites are met, the service can be started with:

```bash
cd ./local-runner

./runFor.sh
```

- Name mentioned in logs:

 ```bash
 ./local-runner/runFor.sh -n Name
 ```

- Remove docker container volume mounted at __./local-runner/postigs__:

```bash
./local-runner/runFor.sh -r
```

Service is then locally available at: <http://localhost:9000>

[RunForScriptDocs](local-runner/runForDoc.md)

## Dependencies

### Service Accounts

#### ./conf/firebase.json

Service Account from Google Cloud for the Firebase Admin Sdk. Needs __Editor__ role.

#### Databases

- __PostgresQl__ Database with Password and User set.
