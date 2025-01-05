CREATE SECURITY POLICY Security.UserSecurityPolicy
ADD FILTER PREDICATE
Security.fn_useraccesspredicate(UserName) ON UserSchema.Users
WITH(STATE=ON, SCHEMABINDING=ON);