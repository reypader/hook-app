import endpoints
from health_check.api import HealthApi

api = endpoints.api_server([HealthApi])
