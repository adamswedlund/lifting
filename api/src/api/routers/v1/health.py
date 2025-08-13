from fastapi import APIRouter
from ...db import check_db_connection

router = APIRouter(tags=["health"])


@router.get("/health")
def health_check():
    check = check_db_connection()
    return {
        "status": "ok" if check else "error",
        "database_status": "connected" if check else "disconnected"
    }