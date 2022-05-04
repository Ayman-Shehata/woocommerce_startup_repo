# Woocommerce_app

A Startup Project (Categories view)

## Getting Started
[WebSite](https://shop.absobject.com/)

Let's try API with postman 
This is a readonly webAPI for get categories 

[WebAPI to view categories](http://shop.absobject.com/wp-json/wc/v2/products/categories?consumer_key=ck_fec37ac0d172a010c7b6a0e988d96af4b2d931bc&consumer_secret=cs_f7b532e73aec482b2378a20f818f05684a0e3242)


```dart
   const mainUrl = 'http://shop.absobject.com/wp-json/wc/v2/';
   const categoriesUrl = 'products/categories';
   //with connectors ? and &
   const consumerKey = '?consumer_key=ck_fec37ac0d172a010c7b6a0e988d96af4b2d931bc&';
   const consumerSecret = 'consumer_secret=cs_f7b532e73aec482b2378a20f818f05684a0e3242';
   
   ```
![img1](https://github.com/Ayman-Shehata/woocommerce_startup_repo/blob/master/preview/postman.PNG)

## JSON response
### you can see
- [
    {Category 1}, {Category 2},{Category 3}
]

-   Image url is in a list of details called 'src' and can be ``` dart null ```
```dart 
    [
    {
        "id": 17,
        "name": "Accessories",
        "slug": "accessories",
        "parent": 0,
        "description": "",
        "display": "default",
        "image": null,
        "menu_order": 0,
        "count": 15,
        "_links": {
            "self": [
                {
                    "href": "https://shop.absobject.com/index.php/wp-json/wc/v2/products/categories/17"
                }
            ],
            "collection": [
                {
                    "href": "https://shop.absobject.com/index.php/wp-json/wc/v2/products/categories"
                }
            ]
        }
    },
    
    {
        "id": 22,
        "name": "Cameras",
        "slug": "cameras",
        "parent": 0,
        "description": "",
        "display": "default",
        "image": {
            "id": 159,
            "date_created": "2020-07-25T05:39:43",
            "date_created_gmt": "2020-07-25T05:39:43",
            "date_modified": "2020-07-25T05:39:43",
            "date_modified_gmt": "2020-07-25T05:39:43",
            "src": "https://shop.absobject.com/wp-content/uploads/2020/07/category-img-1-woo-slider.png",
            "title": "category-img-1-woo-slider",
            "alt": ""
        },
        "menu_order": 0,
        "count": 4,
        "_links": {
            "self": [
                {
                    "href": "https://shop.absobject.com/index.php/wp-json/wc/v2/products/categories/22"
                }
            ],
            "collection": [
                {
                    "href": "https://shop.absobject.com/index.php/wp-json/wc/v2/products/categories"
                }
            ]
        }
    }
]

```