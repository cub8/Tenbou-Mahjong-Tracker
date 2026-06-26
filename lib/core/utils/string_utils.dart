String truncateWithEllipsis(String value, {int maxLength = 15}) =>
    value.length <= maxLength ? value : '${value.substring(0, maxLength)}…';
