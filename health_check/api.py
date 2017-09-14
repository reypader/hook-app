import endpoints
from protorpc import message_types
from protorpc import messages
from protorpc import remote


class HealthResponse(messages.Message):
    """A proto Message that contains a simple string field."""
    content = messages.StringField(1)


HEALTH_RESOURCE = endpoints.ResourceContainer(message_types.VoidMessage)


@endpoints.api(name='health', version='v1')
class HealthApi(remote.Service):
    @endpoints.method(
        HEALTH_RESOURCE,
        HealthResponse,
        path='whoami',
        http_method='GET',
        name='Health Check',
        audiences=['internal']
    )
    def whoami(self, request):
        user = endpoints.get_current_user()
        if not user:
            raise endpoints.UnauthorizedException
        else:
            return HealthResponse(content=user.email())
