this is README.md file of first python application.


# पुढच्या वेळी नवीन machine वर

पहिल्यांदा images pull:

```bash
docker pull bhushan25/new-chatapp:v1
```

```bash
docker pull bhushan25/chatapp-database:v1
```

Network create:

```bash
docker network create chatapp-net
```

Database container:

```bash
docker run -d --name database --network chatapp-net bhushan25/chatapp-database:v1
```

ChatApp container:

```bash
docker run -d --name chatapp --network chatapp-net -p 8000:8000 bhushan25/new-chatapp:v1
```

Check:

```bash
docker ps
```

Network check:

```bash
docker network inspect chatapp-net
```

दोन्ही containers दिसले पाहिजेत:

```text
database
chatapp
```

आता browser:

```text
http://localhost:8000
```

---

## पण एक critical गोष्ट

तुझ्या Django `settings.py` मध्ये:

```python
HOST = 'database'
PORT = '5432'
```

आहे.

म्हणून database container चे नाव **exactly `database`** ठेवणे आवश्यक आहे:

```bash
--name database
```

आणि दोन्ही containers same network मध्ये असणे आवश्यक आहे:

```bash
--network chatapp-net
```

Architecture:

```text
Docker Hub
   |
   +---- bhushan25/new-chatapp:v1
   |              |
   |              v
   |          chatapp
   |              |
   |       chatapp-net
   |              |
   |              v
   +---- bhushan25/chatapp-database:v1
                  |
               database

Browser
   |
   v
localhost:8000
   |
   v
chatapp:8000
```
===================================================================================================
### सर्व commands एकत्र

```bash
docker commit database bhushan25/chatapp-database:v1

docker push bhushan25/new-chatapp:v1

docker push bhushan25/chatapp-database:v1
```

New machine:

```bash
docker pull bhushan25/new-chatapp:v1

docker pull bhushan25/chatapp-database:v1

docker network create chatapp-net

docker run -d --name database --network chatapp-net bhushan25/chatapp-database:v1

docker run -d --name chatapp --network chatapp-net -p 8000:8000 bhushan25/new-chatapp:v1

docker ps
```

Browser:

```text
http://localhost:8000
```

**एक warning:** `docker commit database` केल्यावर त्या specific PostgreSQL container मधील data image मध्ये snapshot होतो. त्यामुळे ही पद्धत practical/learning साठी ठीक आहे; proper DevOps deployment साठी **PostgreSQL image + Docker volume** वापरणे जास्त योग्य आहे.
