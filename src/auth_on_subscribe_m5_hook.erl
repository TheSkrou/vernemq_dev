%% @hidden
-module(auth_on_subscribe_m5_hook).
-include("vernemq_dev_int.hrl").

%% called as an all_till_ok - hook
-callback auth_on_subscribe_m5(UserName      :: username(),
                               SubscriberId  :: subscriber_id(),
                               Topics        :: [{Topic :: topic(), SubInfo :: subinfo()}],
                               Properties    :: sub_properties()) ->
    ok |
    {ok, sub_modifiers()} |
    {error, Reason :: any()} |
    next.

-type sub_properties() ::
        #{
          p_subscription_id => [subscription_id()],
          p_user_property => nonempty_list(user_property())
         }.

-type sub_modifiers() :: #{mountpoint => mountpoint(),
                           max_message_size => non_neg_integer()}.

-type sub_properties() :: #{p_session_expiry_interval => seconds(),
                            p_receive_max => non_neg_integer()}.


-export_type([sub_modifiers/0, sub_properties/0]).
