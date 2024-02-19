

# Water Jug Challenge



Welcome to the Water Jug Challenge! In this task, I've created an application to solve the classic water jug puzzle. The challenge involves using two jugs with different capacities (X gallons and Y gallons) to measure exactly Z gallons of water. The application features a user interface (UI) that displays the state changes of each jug (Empty, Full, or Partially Full) as it progresses towards the solution in a table format.

## Algorithmic Approach


To solve this problem, I utilized the Breadth-First Search (BFS) approach, which is an algorithm used to explore or traverse graphs and tree structures. It begins the search from an initial node and explores all its neighbors before moving on to the neighbors of neighbors, i.e., it explores all nodes at one level before moving to the next level.

Along with this approach, I used the concept of a singly linked list so that when reaching the final result, I could backtrack from this list and provide the user with only the shortest path.

## Goals
1.  **Problem Solving:** Measure Z gallons of water using only the two jugs in the most efficient way possible.
2.  **User Interface Development:** Create a UI where users can input any values for X, Y, and Z, and see the step-by-step solution. If a solution is not possible, the UI should display **“No Solution”**.

## Limitations

- Allowed Actions: Fill, Empty, Transfer (between the two jugs only).
- X, Y and Z are greater than 0
- X, Y and Z are integers (no decimals, fractions)

## Test Cases for Validation
### Case 1
- Bucket x: 2
- Bucket Y: 10
- Target Z: 4

Melhor solução:
<table>
	<thead>
		<th>Bucket X</th>
		<th>Bucket Y</th>
		<th>Explicação</th>
   </thead>
   <tbody>
	   <tr>
	   <td>2</td>
	   <td>0</td>
	   <td>Fill bucket x</td>
</tr>
<tr>
	   <td>0</td>
	   <td>2</td>
	   <td>Transfer from bucket x to bucket y</td>
</tr>
<tr>
	   <td>2</td>
	   <td>2</td>
	   <td>Fill bucket x</td>
</tr>
<tr>
	   <td>0</td>
	   <td>4</td>
	   <td>Transfer from bucket x to bucket y. **Solved**</td>
</tr>

   </tbody>
</table>

### Case 2
- Bucket x: 2
- Bucket Y: 100
- Target Z: 96

Melhor solução:
<table>
	<thead>
		<th>Bucket X</th>
		<th>Bucket Y</th>
		<th>Explicação</th>
   </thead>
   <tbody>
	   <tr>
	   <td>0</td>
	   <td>100</td>
	   <td>Fill bucket y</td>
</tr>
<tr>
	   <td>2</td>
	   <td>98</td>
	   <td>Transfer from bucket y to bucket x</td>
</tr>
<tr>
	   <td>0</td>
	   <td>98</td>
	   <td>Empty bucket x</td>
</tr>
<tr>
	   <td>2</td>
	   <td>96</td>
	   <td>Transfer from bucket y to bucket x. **Solved**</td>
</tr>

   </tbody>
</table>

## Instructions
To run the application, follow the steps below:

1. Clone the Repository
    ```
    git clone https://github.com/josaphatcampos/watterjugchallenge.git
    ```
2. In the project folder, run the following command line in the terminal:
    ```
   flutter run
   ```
