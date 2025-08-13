import fastapi
import uvicorn
from .routers.v1 import health

app = fastapi.FastAPI()
app.include_router(health.router)

if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8443)

    
@app.get("/")
def read_root():
    return {"message": "Hello, World!"}