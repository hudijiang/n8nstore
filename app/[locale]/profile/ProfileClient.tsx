'use client';

import { useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import Card from '@/components/ui/Card';
import { User, Mail, MapPin, Globe, Calendar, Edit2, Save, X, Upload } from 'lucide-react';
import type { User as SupabaseUser } from '@supabase/supabase-js';

interface ProfileClientProps {
    user: SupabaseUser;
    profile: any;
    locale: string;
}

export default function ProfileClient({ user, profile, locale }: ProfileClientProps) {
    const [isEditing, setIsEditing] = useState(false);
    const [saving, setSaving] = useState(false);
    const [formData, setFormData] = useState({
        username: profile?.username || '',
        full_name: profile?.full_name || user.user_metadata?.full_name || '',
        bio: profile?.bio || '',
        website: profile?.website || '',
        location: profile?.location || '',
    });

    const supabase = createClient();

    const handleSave = async () => {
        setSaving(true);
        try {
            const { error } = await supabase
                .from('user_profiles')
                .upsert({
                    id: user.id,
                    ...formData,
                    updated_at: new Date().toISOString(),
                });

            if (error) throw error;

            setIsEditing(false);
            window.location.reload();
        } catch (error) {
            console.error('Error updating profile:', error);
            alert('更新失败，请重试');
        } finally {
            setSaving(false);
        }
    };

    return (
        <Card className="p-8 bg-white/60">
            <div className="flex items-start justify-between mb-6">
                <div className="flex items-center gap-4">
                    <div className="w-20 h-20 rounded-full bg-gradient-to-br from-brand to-teal-400 flex items-center justify-center text-white text-2xl font-bold overflow-hidden">
                        {user.user_metadata?.avatar_url ? (
                            <img
                                src={user.user_metadata.avatar_url}
                                alt={formData.full_name}
                                className="w-full h-full object-cover"
                            />
                        ) : (
                            <span>{formData.full_name?.[0] || user.email?.[0].toUpperCase()}</span>
                        )}
                    </div>
                    <div>
                        <h2 className="text-2xl font-bold text-primary">{formData.full_name || '未设置姓名'}</h2>
                        <p className="text-secondary">@{formData.username || '未设置用户名'}</p>
                    </div>
                </div>

                {!isEditing ? (
                    <button
                        onClick={() => setIsEditing(true)}
                        className="flex items-center gap-2 px-4 py-2 rounded-lg bg-brand text-white hover:bg-teal-500 transition-colors"
                    >
                        <Edit2 className="w-4 h-4" />
                        编辑
                    </button>
                ) : (
                    <div className="flex gap-2">
                        <button
                            onClick={handleSave}
                            disabled={saving}
                            className="flex items-center gap-2 px-4 py-2 rounded-lg bg-brand text-white hover:bg-teal-500 transition-colors disabled:opacity-50"
                        >
                            <Save className="w-4 h-4" />
                            保存
                        </button>
                        <button
                            onClick={() => {
                                setIsEditing(false);
                                setFormData({
                                    username: profile?.username || '',
                                    full_name: profile?.full_name || user.user_metadata?.full_name || '',
                                    bio: profile?.bio || '',
                                    website: profile?.website || '',
                                    location: profile?.location || '',
                                });
                            }}
                            className="flex items-center gap-2 px-4 py-2 rounded-lg bg-gray-200 text-gray-700 hover:bg-gray-300 transition-colors"
                        >
                            <X className="w-4 h-4" />
                            取消
                        </button>
                    </div>
                )}
            </div>

            <div className="space-y-4">
                {/* Email */}
                <div className="flex items-center gap-3 p-4 rounded-lg bg-gray-50">
                    <Mail className="w-5 h-5 text-secondary" />
                    <div className="flex-1">
                        <label className="text-xs text-secondary">邮箱</label>
                        <p className="text-primary font-medium">{user.email}</p>
                    </div>
                </div>

                {/* Username */}
                <div className="flex items-center gap-3 p-4 rounded-lg bg-gray-50">
                    <User className="w-5 h-5 text-secondary" />
                    <div className="flex-1">
                        <label className="text-xs text-secondary">用户名</label>
                        {isEditing ? (
                            <input
                                type="text"
                                value={formData.username}
                                onChange={(e) => setFormData({ ...formData, username: e.target.value })}
                                className="w-full mt-1 px-3 py-2 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-brand/50"
                                placeholder="设置用户名"
                            />
                        ) : (
                            <p className="text-primary font-medium">{formData.username || '未设置'}</p>
                        )}
                    </div>
                </div>

                {/* Full Name */}
                <div className="flex items-center gap-3 p-4 rounded-lg bg-gray-50">
                    <User className="w-5 h-5 text-secondary" />
                    <div className="flex-1">
                        <label className="text-xs text-secondary">全名</label>
                        {isEditing ? (
                            <input
                                type="text"
                                value={formData.full_name}
                                onChange={(e) => setFormData({ ...formData, full_name: e.target.value })}
                                className="w-full mt-1 px-3 py-2 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-brand/50"
                                placeholder="输入您的全名"
                            />
                        ) : (
                            <p className="text-primary font-medium">{formData.full_name || '未设置'}</p>
                        )}
                    </div>
                </div>

                {/* Bio */}
                <div className="p-4 rounded-lg bg-gray-50">
                    <label className="text-xs text-secondary">个人简介</label>
                    {isEditing ? (
                        <textarea
                            value={formData.bio}
                            onChange={(e) => setFormData({ ...formData, bio: e.target.value })}
                            className="w-full mt-1 px-3 py-2 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-brand/50 resize-none"
                            rows={3}
                            placeholder="介绍一下自己..."
                        />
                    ) : (
                        <p className="text-primary mt-1">{formData.bio || '未设置'}</p>
                    )}
                </div>

                {/* Website */}
                <div className="flex items-center gap-3 p-4 rounded-lg bg-gray-50">
                    <Globe className="w-5 h-5 text-secondary" />
                    <div className="flex-1">
                        <label className="text-xs text-secondary">网站</label>
                        {isEditing ? (
                            <input
                                type="url"
                                value={formData.website}
                                onChange={(e) => setFormData({ ...formData, website: e.target.value })}
                                className="w-full mt-1 px-3 py-2 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-brand/50"
                                placeholder="https://example.com"
                            />
                        ) : (
                            <p className="text-primary font-medium">
                                {formData.website ? (
                                    <a href={formData.website} target="_blank" rel="noopener noreferrer" className="text-brand hover:underline">
                                        {formData.website}
                                    </a>
                                ) : (
                                    '未设置'
                                )}
                            </p>
                        )}
                    </div>
                </div>

                {/* Location */}
                <div className="flex items-center gap-3 p-4 rounded-lg bg-gray-50">
                    <MapPin className="w-5 h-5 text-secondary" />
                    <div className="flex-1">
                        <label className="text-xs text-secondary">位置</label>
                        {isEditing ? (
                            <input
                                type="text"
                                value={formData.location}
                                onChange={(e) => setFormData({ ...formData, location: e.target.value })}
                                className="w-full mt-1 px-3 py-2 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-brand/50"
                                placeholder="城市, 国家"
                            />
                        ) : (
                            <p className="text-primary font-medium">{formData.location || '未设置'}</p>
                        )}
                    </div>
                </div>

                {/* Registration Date */}
                <div className="flex items-center gap-3 p-4 rounded-lg bg-gray-50">
                    <Calendar className="w-5 h-5 text-secondary" />
                    <div className="flex-1">
                        <label className="text-xs text-secondary">注册时间</label>
                        <p className="text-primary font-medium">
                            {new Date(user.created_at).toLocaleDateString('zh-CN', {
                                year: 'numeric',
                                month: 'long',
                                day: 'numeric',
                            })}
                        </p>
                    </div>
                </div>
            </div>
        </Card>
    );
}
