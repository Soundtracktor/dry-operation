#### Objectives

Create a business transaction `Users::SignUp`

With the following operations:

`Users::CreateOperation` / creates a user
`Organizations::CreateOperation` / creates an organization
`OrganizationMemberships::CreateOperation` / creates an organization_membership with role: :owner
`StripeAPI::Sources::CreateService` / creates a stripe subscription from source_token
`Users::SubscriptionStatus::UpdateOperation` / marks the users subscription as paid or not paid
`Organizations::ValidationWorker` // starts organization validation in background task
`UserMailer.sign_up_mail(user_id).perform_later` //sends sign up mail to user in bg task


We want to validate
- user email is present and unique
- password is present and over 8 chars long
- organization name is present and unique
- source_token is present

We want to use *SOLID* principles

*S*ingle responsibility principle[6]
  a class should have only a single responsibility (i.e. changes to only one part of the software's specification should be able to affect the specification of the class).

*O*pen/closed principle[7]
  "software entities … should be open for extension, but closed for modification."

*L*iskov substitution principle[8]
  "objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program." See also design by contract.

*I*nterface segregation principle[9]
  "many client-specific interfaces are better than one general-purpose interface."[4]

*D*ependency inversion principle[10]
  one should "depend upon abstractions, [not] concretions."[4]


Sum Up 

++
Distinction between business transactions & operations
Declarative steps
Success or Failure response / Monads?
Reusable operation components / container injection/composition
Type checking / validation

--
Too much DSL
[input : output] => [input : output] => mapping is hard
