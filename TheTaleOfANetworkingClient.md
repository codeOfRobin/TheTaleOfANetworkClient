
# The Life And Times of a Networking Client

---

# (Alt-cringe) Networking Client ki kahaani, Robin ki zubaani

^ Today, we're gonna look through the lifetime of a networking client in a general application. 

^ We're going to see how accidental complexity might seep into your app as it grows as a result of decisions you take early on in its lifecycle

^ This story is based on fact. Any similarity with fictitious events or characters was purely coincidental. No animals were harmed in the making of this presentation

---

![inline](VCSkeleton.png)

^ I hope everyone has heard of incidental vs accidental complexity.

^ Soooo it's your first day at your job. You get to see what your app looks like. Project managers explain what it does, ideal personas you never understand. Designers show you amazing ideas and layouts that you'll never be able to make. You want to impress your coworkers with your cool new screens and so you get to work.

---

![inline](TODONetworking.png)

^ Now you need to talk to an API. No biggie, you just sprinkle a bunch of API calls into your View Controller. You can always fix this later, right? Plus, you have to ship an MVP yesterday. Move fast and break things, right?

^ So you google, and you decide to use Alamofire for networking. Everyone uses it, right? What could go wrong?

---

![inline](SprinkleCalls.png)

^ Okay, so far so good

^ But this makes your life a wee bit harder. There's lots of repetition. Your API URL is all over the place, you're parsing json the same way everywhere. Poori 4 saal ki CS degree yaad aati hain. Encapsulation, OOPS, SOLID cheekh cheekh ke bulaate hain. Zameer maanta nahi jab tak yeh code refactor nahi hoga

^ In english. But this makes your life a wee bit harder. There's lots of repetition. Your API URL is all over the place, you're parsing json the same way everywhere. 4 years of CS education calls out to you. Encapsulation, OOPS, SOLID can't leave your dreams. Your heart and soul won't rest till this code is refactored. THIS IS WHY YOURE A PROGRAMMER DAMNIT

---

^ So you sit down one day and decide to actually do that.

# ☕️

---

![inline](Router.png)


^ You put your networking code in a class, and everyone call into it everytime you need to. To further make things better, you decide you want to make a request builder/router/whatever to handle your URLs better

---

![inline](Headers.png)

(image for representational purposes)

^ Awesome. Sooo now your API makes some changes. You have to send an auth token with every request. Later you find Alamofire has adapters to handle this problem better, and you use those. You have to manage state better cos there's a separate session manager object(tokens can change), but that's alright. Again, this is inherent complexity, right?

---

![inline](activityIndicatorExample.png)

^ Onto your next feature where, surprise you're going to add a Network Activity Indicator. Sounds easy, right?

---

![inline](ActivityIndicator.png)

^ So you do the simple obvious thing, and add a counter to your client. Increment and decrement in ALL your requests. Sounds logical right? You add a counter, increment, decrement. Inherent complexity, riiiight? 

---

![inline](AddLogging.png)

^ Now, tragedy strikes: some requests start failing for some reason. Standard Backend Frontend tu-tu main main ensues. You're told to add logging to your networking client. You make a logging function and add it to every networking call in your app. Inherent complexity, right?

---

![inline](URLCredential.png)

^ Of course you later discover that this was a weird default setting in Alamofire, making you very, very sad.

---

![inline](AddResponseLogging.png)

^ Now, tragedy strikes again: there's an actual bug on the server, and to help triage it, you're asked to add logging for responses. You grit your teeth and do what you've always done.

---

# Testing

^ Now you're asked to write tests to prevent this from happening. How hard can it be? You 

---

now you add caching

---

now it's all complex. so many intertwined things happening in one single class

---

Backend changes, they get frustrated, ask you to add your tests to their suite to ensure shit doesn't break. Your code now refers to an iOS specific caching lib, networkactivityindicator, and can't even run on linux

---
