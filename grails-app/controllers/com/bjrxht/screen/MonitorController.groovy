package com.bjrxht.screen
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo
class MonitorController {

    def index() {}

    @MessageMapping("/player")
    @SendTo("/queue/player")
    protected String player(String action) {
        return action;
    }
}
