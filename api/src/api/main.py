import fastapi
import uvicorn

app = fastapi.FastAPI()

if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8443)
@app.get("/")
def read_root():
    return {"message": "Hello, World!"}