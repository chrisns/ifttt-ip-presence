# IFTT maker channel IP presence

Given an IP address it will ping at 1 second intervals and trigger an IFTT event if the device becomes available
I'm using this to detect my [Amazon dash buttons](https://www.amazon.com/Dash-Buttons/b?&node=10667898011), but you can use for phone/watch/[bathroom scales](https://www.withings.com/us/en/products/body) detection in the same way.

You'll need to set up static ip addresses for the devices on your router so that they always get the same one.

You also need to get a IFTT maker key

To use:
```
docker run --restart-always -d \
  -e IFTT_KEY=YOUR_IFTT_MAKER_KEY \
  -e DEVICE_button121=192.168.0.121 \
  -e DEVICE_button120=192.168.0.120 \
  -e DEVICE_weighin=192.168.0.122 \
  chrisns/iftt-presence
```

In this example I'm waiting for two dash buttons on `192.168.0.121` and `192.168.0.120` and I will fire the trigger `button121` and `button120` that I setup in IFTT.
I've also got a bathroom scale and I trigger a `weighin` event when `192.168.0.122` is present.

Notes:
- Theres a weird thing on docker for mac where pings always get a response irregardless of where they're going, so it won't run on that (at time of writing)
- For getting the Amazon dash buttons to register to your wifi without buying stuff see https://blog.georgevanburgh.co.uk/2015/10/18/hacking-amazon-dash-buttons-in-the-uk/
- The backoff for running the event again is 5 seconds, if you need a longer backoff you can set `-e SLEEP=10` for a 10 second backoff time
