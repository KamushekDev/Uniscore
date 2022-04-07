| Type  |	Description  |
| ---   | --- |
| ->	| Solid line without arrow |
| -->	| Dotted line without arrow |
| ->>	| Solid line with arrowhead |
| -->>	| Dotted line with arrowhead |
| -x	| Solid line with a cross at the end |
| --x	| Dotted line with a cross at the end. |
| -)	| Solid line with an open arrow at the end (async) |
| --)	| Dotted line with a open arrow at the end (async) |

```mermaid
sequenceDiagram
    actor us as User
    participant sc as Scores service
    participant auth as Auth service
    participant fire as Firebase

    us ->> sc: 


```