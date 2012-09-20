Scaffeine.Friends.Core (1.1.3)
======

A friendship has 2 parties, the initiator, and the person who accepted.  Friendship can be one way (following).

Use case 1 (following)
-----
User A adds user B as friend.  No approval by user B is required.  Only user A is friends with User B.

Use case 2
-----
User A adds user B as a friend.  User B needs to approve the friendship.  Both are firends with each other.


Use case 3
-----
User A adds user B as a friend.  User B is autoamtically added a friend to user A.


What is a friendship?
-----
A connection, either 1-way, or 2-ways betweeen 2 users.  We want to know who initiated it, when it was approved, and we need 
a simple way to query friends.


Friendship
- User 1 (bad name)
- User 2
- Friendship Type

<pre>
GetFriendsForUser(int userId){
  Select * from Friendships where User1 = userId
}
</pre>

Configuration
-----
<code>

 <$rootnamespace$.Friendships>
     \<allowOneWayFriendships value="true"/>  
 </$rootnamespace$.Friendships>

</code>

    
Usage
======
<pre>install-package Scaffeine.Friends</pre>
Dependencies (2)
=====

ScaffR Packages
------
* [ScaffR (1.1.2)](https://github.com/wcpro/ScaffR/tree/master/src/ScaffR)

Other Packages
------
* T4Scaffolding(1.0.6)
