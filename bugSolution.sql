The solution is to either explicitly convert the column to a numeric type using a function like CAST or TRY_CAST (depending on the database system), or filter out non-numeric values before applying the aggregate function.

**Solution 1: Using CAST/TRY_CAST**

```sql
SELECT SUM(CAST(my_column AS INT)) FROM my_table;
```

This attempts to cast each value to an integer.  If a conversion fails, an error might occur depending on your database system.  TRY_CAST would be preferred in situations where you want to handle conversion failures gracefully.

**Solution 2: Handling conversion failures (example with TRY_CAST in SQL Server):**

```sql
SELECT SUM(TRY_CAST(my_column AS INT)) FROM my_table;
```

TRY_CAST will return NULL if the conversion fails, allowing SUM to proceed without errors.

**Solution 3: Filtering non-numeric values**

This approach is database-specific and depends on how you identify non-numeric values.  The following example is illustrative but needs adjustments based on the database system.

```sql
SELECT SUM(CAST(my_column AS INT)) FROM my_table WHERE ISNUMERIC(my_column) = 1;
```
This filters the rows to include only those where `my_column` is numeric (using ISNUMERIC in SQL Server – this function might differ depending on the database system.)