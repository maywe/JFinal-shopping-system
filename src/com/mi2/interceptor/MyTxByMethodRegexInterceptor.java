package com.mi2.interceptor;

import com.base.interceptor.BaseInterceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Config;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.DbPro;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.tx.Tx;

import java.sql.SQLException;
import java.util.regex.Pattern;

/**
 * 自定义方法事务拦截器
 *
 * @author ChenMW 2016-03-07 9:34
 */
public class MyTxByMethodRegexInterceptor extends BaseInterceptor {

    private Pattern pattern;

    public MyTxByMethodRegexInterceptor(String regex) {
        this(regex, true);
    }

    public MyTxByMethodRegexInterceptor(String regex, boolean caseSensitive) {
        if (StrKit.isBlank(regex)) {
            throw new IllegalArgumentException("regex can not be blank.");
        }
        pattern = caseSensitive ? Pattern.compile(regex) : Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
    }

    @Override
    public void doIntercept(final Invocation inv) {
        Config config = Tx.getConfigWithTxConfig(inv);
        if (config == null) {
            config = DbKit.getConfig();
        }
        if (pattern.matcher(inv.getMethodName()).matches()) {
            DbPro.use(config.getName()).tx(new IAtom() {
                public boolean run() throws SQLException {
                inv.invoke();
                Object returnValue = inv.getReturnValue();
                if(returnValue instanceof Boolean){
                    return (Boolean)returnValue;
                }
                return true;
                }
            });
        } else {
            inv.invoke();
        }
    }
}
