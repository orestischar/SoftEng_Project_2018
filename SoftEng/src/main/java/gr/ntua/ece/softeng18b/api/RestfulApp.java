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

        //GET, POST
        router.attach("/prices", PriceResource.class);

        //GET, DELETE
        router.attach("/products/{id}", ProductResource.class);
        
         //GET, DELETE
        router.attach("/shops/{id}", ShopResource.class);
        

        //GET
        router.attach("/productname/{name}", ProductNameResource.class);
       
        //GET
        router.attach("/shopsname", ShopsNameResource.class);


        //POST
        router.attach("/signup", UserResource.class);
        router.attach("/login",  LoginResource.class);        
        router.attach("/logout", LogoutResource.class);
        

        return router;
    }

}
