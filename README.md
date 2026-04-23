# IA510 MP3 — SQL Query Pack + AI Critique

## AI use (course policy)

**Allowed:** explain concepts, approaches, starter snippets, SQL suggestions, README help.

**Required:** frequent commits, this `AI_Usage.md` file, and verification (SQL output, screenshots, or runs).

**Not allowed:** submitting work you do not understand, fabricating evidence, or copying another student's repository.

## Grading: pytest vs rubric

- **pytest** in GitHub Actions is a **pass/fail gate** (does it run, are basic contracts met). It is **not** mapped to rubric point rows.
- Your **instructor assigns the 10 points** using the rubric below.

**Org Actions:** If GitHub Actions are disabled on student repositories in this organization, run the same checks locally: `docker compose up -d` then `pytest -q` (see README). The rubric still applies.


## Goal

Write a focused query pack, add a view where appropriate, and document an AI-assisted critique/improvement cycle.

## Deliverables

- `queries.sql` — keep `-- Q1` … `-- Q10` section markers (autograde checks markers and executes the first 10 statements).
- `views.sql`
- `evidence/sample_output.md`
- `AI_Usage.md`

## Verify locally

```bash
docker compose up -d
pip install -r requirements-dev.txt
export PGHOST=localhost PGPORT=5434 PGDATABASE=ia510 PGUSER=ia510_user PGPASSWORD=ia510_pass
pytest -q
docker compose down -v
```

## Rubric (10 points)

| Criteria | Excellent | Good | Satisfactory | Needs Improvement | Pts |
| --- | --- | --- | --- | --- | --- |
| Query correctness (10) | All correct; match intent | 1–2 minor issues | Several wrong/unclear | Many broken/missing | 5 |
| Variety & difficulty | Strong variety (join, agg, subquery/CTE, view) | Good variety; missing one element | Limited variety | Mostly basic SELECT | 3 |
| Improvement from AI critique | Clear before/after documented | Some improvements noted | Minimal evidence | No critique/changes | 2 |

