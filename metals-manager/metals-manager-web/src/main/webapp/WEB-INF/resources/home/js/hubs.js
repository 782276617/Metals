/*!
 * ASP.NET SignalR JavaScript Library v1.1.4
 * http://signalr.net/
 *
 * Copyright Microsoft Open Technologies, Inc. All rights reserved.
 * Licensed under the Apache 2.0
 * https://github.com/SignalR/SignalR/blob/master/LICENSE.md
 *
 */

/// <reference path="..\..\SignalR.Client.JS\Scripts\jquery-1.6.4.js" />
/// <reference path="jquery.signalR.js"/*tpa=http://www.0760wj.com/signalr/jquery.signalR.js*/ />
(function ($, window) {
    /// <param name="$" type="jQuery" />
    "use strict";

    if (typeof ($.signalR) !== "function") {
        throw new Error("SignalR: SignalR is not loaded. Please ensure jquery.signalR-x.js is referenced before ~/signalr/hubs.");
    }

    var signalR = $.signalR;

    function makeProxyCallback(hub, callback) {
        return function () {
            // Call the client hub method
            callback.apply(hub, $.makeArray(arguments));
        };
    }

    function registerHubProxies(instance, shouldSubscribe) {
        var key, hub, memberKey, memberValue, subscriptionMethod;

        for (key in instance) {
            if (instance.hasOwnProperty(key)) {
                hub = instance[key];

                if (!(hub.hubName)) {
                    // Not a client hub
                    continue;
                }

                if (shouldSubscribe) {
                    // We want to subscribe to the hub events
                    subscriptionMethod = hub.on;
                }
                else {
                    // We want to unsubscribe from the hub events
                    subscriptionMethod = hub.off;
                }

                // Loop through all members on the hub and find client hub functions to subscribe/unsubscribe
                for (memberKey in hub.client) {
                    if (hub.client.hasOwnProperty(memberKey)) {
                        memberValue = hub.client[memberKey];

                        if (!$.isFunction(memberValue)) {
                            // Not a client hub function
                            continue;
                        }

                        subscriptionMethod.call(hub, memberKey, makeProxyCallback(hub, memberValue));
                    }
                }
            }
        }
    }

    $.hubConnection.prototype.createHubProxies = function () {
        var proxies = {};
        this.starting(function () {
            // Register the hub proxies as subscribed
            // (instance, shouldSubscribe)
            registerHubProxies(proxies, true);

            this._registerSubscribedHubs();
        }).disconnected(function () {
            // Unsubscribe all hub proxies when we "disconnect".  This is to ensure that we do not re-add functional call backs.
            // (instance, shouldSubscribe)
            registerHubProxies(proxies, false);
        });

        proxies.BaseHub = this.createHubProxy('BaseHub'); 
        proxies.BaseHub.client = { };
        proxies.BaseHub.server = {
            getSeckillInfo: function (id) {
                return proxies.BaseHub.invoke.apply(proxies.BaseHub, $.merge(["getSeckillInfo"], $.makeArray(arguments)));
             },

            handleQueue: function () {
                return proxies.BaseHub.invoke.apply(proxies.BaseHub, $.merge(["HandleQueue"], $.makeArray(arguments)));
             },

            printLog: function (text) {
                return proxies.BaseHub.invoke.apply(proxies.BaseHub, $.merge(["printLog"], $.makeArray(arguments)));
             },

            sendLogin: function (mid) {
                return proxies.BaseHub.invoke.apply(proxies.BaseHub, $.merge(["SendLogin"], $.makeArray(arguments)));
             },

            sendUsersMsg: function (mid, seckillid, ConnectionId, phone, headImg, m_name) {
                return proxies.BaseHub.invoke.apply(proxies.BaseHub, $.merge(["SendUsersMsg"], $.makeArray(arguments)));
             },

            sendWxUsersMsg: function (mid, seckillid, ConnectionId, phone, headImg, m_name, shopType) {
                return proxies.BaseHub.invoke.apply(proxies.BaseHub, $.merge(["SendWxUsersMsg"], $.makeArray(arguments)));
             }
        };

        return proxies;
    };

    signalR.hub = $.hubConnection("/signalr", { useDefaultPath: false });
    $.extend(signalR, signalR.hub.createHubProxies());

}(window.jQuery, window));