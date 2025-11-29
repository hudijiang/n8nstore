'use client';

import { useState } from 'react';
import { useAuth } from './AuthProvider';
import { User, LogOut, ShoppingBag } from 'lucide-react';
import Link from 'next/link';

interface AuthButtonProps {
    locale: string;
    translations: Record<string, string>;
}

export default function AuthButton({ locale, translations }: AuthButtonProps) {
    const { user, loading, signOut } = useAuth();
    const [showMenu, setShowMenu] = useState(false);

    if (loading) {
        return (
            <div className="w-10 h-10 rounded-full bg-gray-200 animate-pulse" />
        );
    }

    if (!user) {
        return (
            <Link
                href={`/${locale}/login` as any}
                className="px-6 py-2.5 rounded-full bg-brand text-white font-medium hover:bg-teal-500 transition-all shadow-md hover:shadow-lg"
            >
                {translations.nav_login || 'Login'}
            </Link>
        );
    }

    return (
        <div className="relative">
            <button
                onClick={() => setShowMenu(!showMenu)}
                className="w-10 h-10 rounded-full bg-gradient-to-br from-brand to-teal-400 flex items-center justify-center text-white font-medium hover:shadow-lg transition-all"
            >
                {user.user_metadata?.avatar_url ? (
                    <img
                        src={user.user_metadata.avatar_url}
                        alt={user.user_metadata?.full_name || 'User'}
                        className="w-full h-full rounded-full object-cover"
                    />
                ) : (
                    <span className="text-sm">
                        {user.email?.[0].toUpperCase()}
                    </span>
                )}
            </button>

            {showMenu && (
                <>
                    <div
                        className="fixed inset-0 z-40"
                        onClick={() => setShowMenu(false)}
                    />
                    <div className="absolute right-0 mt-2 w-64 bg-white rounded-2xl shadow-xl border border-gray-100 py-2 z-50">
                        <div className="px-4 py-3 border-b border-gray-100">
                            <p className="font-medium text-primary truncate">
                                {user.user_metadata?.full_name || user.email}
                            </p>
                            <p className="text-sm text-secondary truncate">{user.email}</p>
                        </div>

                        <div className="py-2">
                            <a
                                href={`/${locale}/profile`}
                                className="flex items-center gap-3 px-4 py-2.5 hover:bg-gray-50 transition-colors text-gray-700"
                            >
                                <User className="w-5 h-5" />
                                <span>{translations.nav_profile || '个人资料'}</span>
                            </a>
                            <a
                                href={`/${locale}/user`}
                                className="flex items-center gap-3 px-4 py-2.5 hover:bg-gray-50 transition-colors text-gray-700"
                            >
                                <ShoppingBag className="w-5 h-5" />
                                <span>{translations.nav_orders || '我的订单'}</span>
                            </a>
                        </div>

                        <div className="border-t border-gray-100 pt-2">
                            <button
                                onClick={() => {
                                    signOut();
                                    setShowMenu(false);
                                }}
                                className="flex items-center gap-3 px-4 py-2.5 hover:bg-red-50 transition-colors text-red-600 w-full"
                            >
                                <LogOut className="w-5 h-5" />
                                <span>{translations.nav_logout || '登出'}</span>
                            </button>
                        </div>
                    </div>
                </>
            )}
        </div>
    );
}
