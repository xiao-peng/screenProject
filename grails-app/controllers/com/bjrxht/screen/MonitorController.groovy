package com.bjrxht.screen

import grails.converters.JSON
import org.geeks.browserdetection.UserAgentIdentService
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo
class MonitorController {
    UserAgentIdentService userAgentIdentService
    def brokerMessagingTemplate
    def index() {
         if(userAgentIdentService.isMobile()){
             if(userAgentIdentService.isiOsDevice()){
                 render view:"index-ios"
                 return;
             }
             if(userAgentIdentService.isAndroid()){

             }
             render view:"index-mobile"
         }
    }
    def ajaxProcess(){
        def map=[:]
        if(params.process){
            //this.player(params.action);
            brokerMessagingTemplate.convertAndSend "/queue/player",params.process
        }
        map.result=true;
        render map as JSON;
    }

    @MessageMapping("/player")
    @SendTo("/queue/player")
    protected String player(String action) {
        return action;
    }
}
