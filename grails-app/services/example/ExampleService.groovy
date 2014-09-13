package example

import grails.transaction.Transactional

@Transactional
class ExampleService {

    def brokerMessagingTemplate

    void hello() {
        brokerMessagingTemplate.convertAndSend "/topic/hello", "hello from service!"
    }
}
