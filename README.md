# AODV-GUI-in-WSN
This code is for a MATLAB GUI in which AODV routing protocol is implemented for WSN. The source nodes are changing each time with number of packets. The snapshot of GUI is attached.Its a dynamic GUI.

AODV (Ad-hoc On-demand Distance Vector) is a loop-free routing protocol for ad-hoc networks. It is designed to be self-starting in an environment of mobile nodes, withstanding a variety of network behaviors such as node mobility, link failures and packet losses.
At each node, AODV maintains a routing table. The routing table entry for a destination contains three essential fields: a next hop node, a sequence number and a hop count. All packets destined to the destination are sent to the next hop node. The sequence number acts as a form of time-stamping, and is a measure of the freshness of a route. The hop count represents the current distance to the destination node.

![aodv1](https://user-images.githubusercontent.com/11607018/37191379-2ddc0a18-2385-11e8-9914-c677923f57f9.png)
