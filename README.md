# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.4.2
* LittleSQL(will be changed to mySQL for production)
* SideKiq(using as a job runner)


    to start server - bundle exec sidekiq
    
* REDIS Server installed and actively running. It is required by SideKiq
    
    
    run on the back - redis-server --daemonize yes
    
    check if active - ps aux | grep redis-server
    
    kill background job - redis-cli shutdown
    
* Gmain_v1 installed and access allowed in browser in case of new access lvl(should be 1 time thing)
* GEMS:
    
    
    gem install google-api-client