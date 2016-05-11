function tu = matlab2unix(tm)
    tu = round(8.64e7 * (tm - datenum('1970', 'yyyy')));
end