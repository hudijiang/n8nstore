export default function Tag({ children }: { children: string }) {
  return <span className="text-[11px] font-medium px-2.5 py-1 rounded-full bg-gray-100 text-gray-600 border border-gray-200">{children}</span>
}