# Prometheus on Render
This is a template repository for running [Prometheus](https://prometheus.io/) on [Render](https://render.com/). To show how to configure Prometheus on Render, this template includes a sample Flask applcation which exports HTTP request metrics to Prometheus. 

Click the button below to deploy Prometheus and sample Flask to your Render account:

[![Deploy to Render](http://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

Once the Blueprint is succesfully deployed, two services will be created. 

![](https://i.imgur.com/chykGUL.png)

In the `prometheus` service dashboard, you can click the onrender.com URL to open Prometheus web UI. You can use this interface to query Prometheus metrics.
> For production service, we recommand to add [authentication](https://prometheus.io/docs/guides/basic-auth/) to limit the access.

Now you can try to call `flask` service with the onrender.com URL from the `flask` service dashboard.
```
curl  https://flask-<REPLACE ME>.onrender.com/one
```
Go back to Prometheus web UI and query the `flask` service's total number of HTTP requests:
```
sum(flask_http_request_total)
```
The number should be increased.

![](https://i.imgur.com/8itHaVz.png)

## Prometheus with your own service

If your service already exports metrics to Prometheus, you can use another template `render-prometheus-only.yaml` which doesn't create sample flask service. Please fork this repo and replace existing `render.yaml`.
```
cp render-prometheus-only.yaml render.yaml
```
When you deploy this Blueprint, it will ask for your service name and port.

![](https://i.imgur.com/yyl3FdT.png)

You can find them from the `Internal Address` in your service dashboard. In this example, `SCRAPE_SERVICE_NAME` is `flask-4dx6` and the `SCRAPE_SERVICE_PORT` is `5000`.

![](https://i.imgur.com/XoRkP92.png)

> This template only configure Prometheus to scrape one service. For multiple service, please directly update `prometheus.yml`.





