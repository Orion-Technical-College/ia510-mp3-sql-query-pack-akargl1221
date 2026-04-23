import pathlib
import re


def _split_sql(sql: str):
    parts = []
    buf = []
    for line in sql.splitlines():
        if line.strip().startswith("--"):
            continue
        buf.append(line)
    text = "\n".join(buf)
    for stmt in text.split(";"):
        s = stmt.strip()
        if s:
            parts.append(s)
    return parts


def test_queries_file_structure():
    q = pathlib.Path(__file__).resolve().parents[1] / "queries.sql"
    body = q.read_text(encoding="utf-8")
    for i in range(1, 11):
        assert re.search(rf"--\s*Q{i}\b", body), f"Missing Q{i} marker"


def test_run_queries(db_conn):
    q = pathlib.Path(__file__).resolve().parents[1] / "queries.sql"
    stmts = _split_sql(q.read_text(encoding="utf-8"))
    assert len(stmts) >= 10
    with db_conn.cursor() as cur:
        for stmt in stmts[:10]:
            cur.execute(stmt)


def test_views_sql_runs(db_conn):
    v = pathlib.Path(__file__).resolve().parents[1] / "views.sql"
    with db_conn.cursor() as cur:
        cur.execute(v.read_text(encoding="utf-8"))
