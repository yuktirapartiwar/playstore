package com.playstore.APIGateway.config;

import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ApiGatewayRouting {
	@Bean
	public RouteLocator customRouteLocator(RouteLocatorBuilder builder) {
		return builder.routes()
				// Route to Admin Service using Load Balancer
				.route("admin-service", r -> r
						.path("/admin/**")
						.uri("http://localhost:8081/"))
				// Route to User Service using Load Balancer
				.route("user-service", r -> r
						.path("/user/**")
						.uri("http://localhost:8082/"))
				.build();
	}
}