// ********************
var SessionViewModel = function (settings) {
    var self = this;
    var NO_OF_SECONDS = 60;

    this.ScopeWrapper = ko.observable(settings.ScopeWrapper);
    this.SessionTimeout = ko.observable(settings.SessionTimeout);
    this.SessionTimeoutDefault = ko.observable(settings.SessionTimeout);
    this.WarningTimeInMinutes = ko.observable(settings.WarningTimeInMinutes);
    this.ModalScope = ko.observable(settings.ModalScope);
    this.UserId = ko.observable(settings.UserId);

    this.IsAnonymousUser = ko.computed(function () {
        return self.UserId() <= 0;
    });

    this.onModuleLoad = function () {
        if (!self.IsAnonymousUser()) {
            self.startTimer();
        }
    }

    this.startTimer = function () {
        if (self.SessionTimeout() > 0) {
            setTimeout(self.checkTimeout, 1000 * NO_OF_SECONDS);
        } else {
            self.showAlert();
        }
    }

    this.checkTimeout = function () {
        var sessionTime = self.SessionTimeout() - 1;
        self.SessionTimeout(sessionTime);

        if (sessionTime == self.WarningTimeInMinutes()) {
            self.showAlert();
        }

        self.startTimer();
    }

    this.showAlert = function () {
        $('#' + self.ModalScope()).modal();
    }

    this.resetTimeout = function () {
        self.SessionTimeout(self.SessionTimeoutDefault());
        $('#' + self.ModalScope()).modal('hide');
    }
};