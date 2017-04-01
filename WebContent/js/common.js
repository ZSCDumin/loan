$.extend($.fn.validatebox.defaults.rules, {
    midLength: {
        validator: function (value, param) {
            return value.length >= param[0] && value.length <= param[1];
        },
        message: '用户名长度至少为6位,最长为12位'
    },
    passLength: {
        validator: function (value, param) {
            return value.length >= param[0] && value.length <= param[1];
        },
        message: '用户名长度至少为6位,最长为20位'
    }
});

