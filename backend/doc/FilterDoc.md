## AccessFilter Documentation

###### Last Updated: 17.06.202

Official Play Documentation: [Play Filters Documentation 2.8](https://www.playframework.com/documentation/2.8.x/Filters)

<br/>

Filters are defined in [application.conf](../conf/application.conf):

        play.io.todo.metadata.filters.enabled = [
          "io.todo.metadata.filters.logging.AccessLoggingFilter",
          "io.todo.metadata.filters.access.RouteBlacklistFilter",
          "play.io.todo.metadata.filters.cors.CORSFilter"
         ]

## Filters:

### AccessLoggingFilter

[Go To File](../app/io/todo/metadata/filters/logging/AccessLoggingFilter.scala)

- Logs all requests where the statusCode is contained in [application.conf](../conf/application.conf):

        logging.access.statusList = [404,403,401]
        logging.access.statusList = ${?LOGGING_STATUSLIST}

### RouteBlacklistFilter

[Go To File](../app/io/todo/metadata/filters/access/RouteBlacklistFilter.scala)

- Blocks all requests defined in RouteBlacklistFilter.scala



