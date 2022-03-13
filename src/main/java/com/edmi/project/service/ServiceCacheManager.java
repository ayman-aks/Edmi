package com.edmi.project.service;

import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.Collection;

@EnableAsync
@Service
public class ServiceCacheManager {
    CacheManager cacheManager=new CacheManager() {
        @Override
        public Cache getCache(String name) {
            return null;
        }

        @Override
        public Collection<String> getCacheNames() {
            return null;
        }
    };
    @Async
    @Scheduled(fixedRate = 1)
    public void clearAllCaches(){
        for(String name:cacheManager.getCacheNames()){
            cacheManager.getCache(name).clear();
        }
    }
}
