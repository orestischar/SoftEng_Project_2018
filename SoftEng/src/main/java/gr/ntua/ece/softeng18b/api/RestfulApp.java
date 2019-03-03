package gr.ntua.ece.softeng18b.api;

import org.restlet.Application;
import org.restlet.Restlet;
import org.restlet.routing.Router;

public class RestfulApp extends Application {

    @Override
    public synchronized Restlet createInboundRoot() {

        Router router = new Router(getContext());

        //GET, POST
        router.attach("/products", ProductsResource.class);
        
        //GET, POST
        router.attach("/shops", ShopsResource.class);

        //GET, DELETE
        router.attach("/products/{id}", ProductResource.class);

        //GET
        router.attach("/productsname/{name}", ProductsNameResource.class);

        //GET, DELETE
        router.attach("/shops/{id}", ShopResource.class);

        //GET
        router.attach("/shopname/{name}", ShopNameResource.class);

        router.attach("/login", LoginResource.class);

        //POST
        router.attach("/signup", UserResource.class);

        return router;
    }

}
